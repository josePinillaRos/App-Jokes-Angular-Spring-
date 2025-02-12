import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';

import { JokesService } from '../jokes.service';

@Component({
  standalone: true,
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css'],
  imports: [CommonModule, FormsModule, RouterModule]
})
export class CreateComponent implements OnInit {
  joke = {
    categoryId: null,
    languageId: null,
    typeId: null,
    text1: '',
    text2: '',
    flagses: [] as number[] // Arreglo de IDs de flags
  };

  errorMsg: string | null = null;

  categories: Array<{ id: number; name: string }> = [];
  languages: Array<{ id: number; name: string }> = [];
  types: Array<{ id: number; name: string }> = [];
  flags: Array<{ id: number; name: string; selected: boolean }> = [];

  constructor(
    private jokesService: JokesService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadCategories();
    this.loadLanguages();
    this.loadTypes();
    this.loadFlags();
  }

  loadCategories(): void {
    this.jokesService.getCategories().subscribe({
      next: (data) => (this.categories = data),
      error: (err) => console.error('Error al cargar categorías:', err)
    });
  }

  loadLanguages(): void {
    this.jokesService.getLanguages().subscribe({
      next: (data) => {
        this.languages = data.map((lang) => ({
          id: lang.id,
          name: lang.name || lang.language
        }));
      },
      error: (err) => console.error('Error al cargar idiomas:', err)
    });
  }

  loadTypes(): void {
    this.jokesService.getTypes().subscribe({
      next: (data) => (this.types = data),
      error: (err) => console.error('Error al cargar tipos:', err)
    });
  }

  loadFlags(): void {
    this.jokesService.getFlags().subscribe({
      next: (data) => {
        this.flags = data.map((flag) => ({
          id: flag.id,
          name: flag.name,
          selected: false
        }));
      },
      error: (err) => console.error('Error al cargar flags:', err)
    });
  }

  checkboxChanged(event: Event, flagObj: { id: number; selected: boolean }) {
    const isChecked = (event.target as HTMLInputElement).checked;
    if (isChecked) {
      // Añade el ID de la flag al arreglo de flagses
      this.joke.flagses.push(flagObj.id);
      flagObj.selected = true;
    } else {
      // Elimina el ID de la flag del arreglo de flagses
      this.joke.flagses = this.joke.flagses.filter((id) => id !== flagObj.id);
      flagObj.selected = false;
    }
  }

  createJoke(): void {
    // Validación básica
    if (!this.joke.text1 || (this.joke.typeId === 2 && !this.joke.text2)) {
      this.errorMsg = 'Por favor, complete todos los campos obligatorios.';
      return;
    }

    this.jokesService.create(this.joke).subscribe({
      next: () => this.router.navigate(['/jokes']),
      error: (err) => {
        this.errorMsg = err.error
          ? err.error.error
          : 'Error al crear el chiste.';
      }
    });
  }
}
