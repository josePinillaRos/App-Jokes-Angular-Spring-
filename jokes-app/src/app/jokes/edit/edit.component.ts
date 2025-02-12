import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { forkJoin } from 'rxjs';

// Importamos tu servicio y sus interfaces
import { JokesService, JokesNamesDTO, JokeUpdateDTO } from '../jokes.service';

@Component({
  standalone: true,
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css'],
  imports: [CommonModule, FormsModule, RouterModule],
})
export class EditComponent implements OnInit {
  jokeId!: number;
  errorMsg: string | null = null;

  // Este es el objeto que se envía en el PUT
  jokeDTO: JokeUpdateDTO = {
    id: null,
    categoryId: null,
    languageId: null,
    typeId: null,
    text1: '',
    text2: '',
    flagses: [],
  };

  // Este guardará la respuesta del GET (nombres de cat/lang/type/flags)
  jokeNames!: JokesNamesDTO;

  // Datos para <select> y checkboxes
  categories: Array<{ id: number; name: string }> = [];
  languages: Array<{ id: number; name: string }> = [];
  types: Array<{ id: number; name: string }> = [];
  flags: Array<{ id: number; name: string; selected: boolean }> = [];

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private jokesService: JokesService
  ) {}

  ngOnInit(): void {
    // 1. Obtener el ID desde la ruta
    this.jokeId = Number(this.route.snapshot.paramMap.get('id'));

    // 2. Cargar todo en paralelo con forkJoin:
    //    - El chiste con nombres
    //    - Categorías
    //    - Idiomas
    //    - Tipos
    //    - Flags
    forkJoin({
      joke: this.jokesService.getById(this.jokeId),     // GET /jokes/{id} => JokesNamesDTO
      cats: this.jokesService.getCategories(),          // [{id, name}, ...]
      langs: this.jokesService.getLanguages(),          // [{id, name}, ...]
      tps: this.jokesService.getTypes(),                // [{id, name}, ...]
      fls: this.jokesService.getFlags(),                // [{id, name}, ...]
    }).subscribe({
      next: ({ joke, cats, langs, tps, fls }) => {
        // a) Guardamos en variables locales
        this.jokeNames = joke; 
        this.categories = cats;
        this.languages = langs.map((lg) => ({
          id: lg.id,
          name: lg.name || lg.language, // Asegúrate de usar el campo correcto
        }));
        this.types = tps;

        // Inicializamos 'flags' con selected=false
        this.flags = fls.map((f) => ({
          id: f.id,
          name: f.name,
          selected: false,
        }));

        // b) Llenar los TEXTOS que vienen en JokesNamesDTO
        this.jokeDTO.id = joke.id;
        this.jokeDTO.text1 = joke.text1;
        this.jokeDTO.text2 = joke.text2;

        // c) Buscar la categoría cuyo 'name' coincida con joke.categoryName
        if (joke.categoryName) {
          const foundCat = this.categories.find(
            (c) => c.name === joke.categoryName
          );
          this.jokeDTO.categoryId = foundCat ? foundCat.id : null;
        }

        // d) Buscar el idioma
        if (joke.languageName) {
          const foundLang = this.languages.find(
            (l) => l.name === joke.languageName
          );
          this.jokeDTO.languageId = foundLang ? foundLang.id : null;
        }

        // e) Buscar el tipo
        if (joke.typeName) {
          const foundType = this.types.find(
            (t) => t.name === joke.typeName
          );
          this.jokeDTO.typeId = foundType ? foundType.id : null;
        }

        // f) Marcar flags
        // joke.flagsNames es un array de string, e.g. ["racist", "explicit"]
        // Buscamos cada una en 'this.flags'
        this.jokeDTO.flagses = []; // vaciamos primero
        joke.flagsNames.forEach((flagName) => {
          const flagObj = this.flags.find((f) => f.name === flagName);
          if (flagObj) {
            flagObj.selected = true;
            this.jokeDTO.flagses.push(flagObj.id);
          }
        });

        // g) Ajustar text2 si el tipo es single
        this.onTypeChange();
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar datos: ' + err.message;
      },
    });
  }

  // Cuando el usuario cambia el Tipo en el <select>
  onTypeChange(): void {
    if (this.jokeDTO.typeId === 1) {
      // Single => vaciamos text2
      this.jokeDTO.text2 = '';
    }
  }

  // Checkboxes
  checkboxChanged(event: Event, flagObj: { id: number; selected: boolean }) {
    const checked = (event.target as HTMLInputElement).checked;
    flagObj.selected = checked;
    if (checked) {
      if (!this.jokeDTO.flagses.includes(flagObj.id)) {
        this.jokeDTO.flagses.push(flagObj.id);
      }
    } else {
      this.jokeDTO.flagses = this.jokeDTO.flagses.filter(
        (fid) => fid !== flagObj.id
      );
    }
  }

  // Validaciones antes de PUT
  validateForm(): boolean {
    // Para typeId=1 => text1 lleno, text2 vacío
    // Para typeId=2 => text1 y text2 llenos
    if (this.jokeDTO.typeId === 1) {
      if (!this.jokeDTO.text1.trim()) {
        this.errorMsg = "Error: Para el tipo 1, 'text1' debe estar lleno.";
        return false;
      }
      if (this.jokeDTO.text2 && this.jokeDTO.text2.trim()) {
        this.errorMsg = "Error: Para el tipo 1, 'text2' debe estar vacío.";
        return false;
      }
    } else if (this.jokeDTO.typeId === 2) {
      if (!this.jokeDTO.text1.trim()) {
        this.errorMsg = "Error: Para el tipo 2, 'text1' es obligatorio.";
        return false;
      }
      if (!this.jokeDTO.text2.trim()) {
        this.errorMsg = "Error: Para el tipo 2, 'text2' es obligatorio.";
        return false;
      }
    } else {
      this.errorMsg = 'Error: Tipo de chiste no válido.';
      return false;
    }
    this.errorMsg = null;
    return true;
  }

  // Envía el PUT /jokes/{id}
  updateJoke(): void {
    if (!this.validateForm()) return;

    this.jokesService.update(this.jokeId, this.jokeDTO).subscribe({
      next: () => {
        this.router.navigate(['/jokes']);
      },
      error: (err) => {
        this.errorMsg = err.error?.mensaje || err.error?.error || 'Error al actualizar el chiste.';
      },
    });
  }
}
