import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

import { LanguageService, LanguageDTO } from '../language.service';

@Component({
  standalone: true,
  selector: 'app-language-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css'],
  imports: [CommonModule, RouterLink]
})
export class ListComponent implements OnInit {
  languages: LanguageDTO[] = [];
  errorMsg: string | null = null;

  constructor(private languageService: LanguageService) {}

  ngOnInit(): void {
    this.loadAllLanguages();
  }

  loadAllLanguages(): void {
    this.languageService.getAll().subscribe({
      next: (data) => {
        this.languages = data;
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar los idiomas: ' + err.message;
      }
    });
  }

  deleteLanguageWithJokes(id: number): void {
    this.languageService.countJokesByLanguage(id).subscribe({
      next: (data) => {
        const jokesCount = data.jokesCount;

        if (confirm(`Este idioma tiene ${jokesCount} chistes asociados. ¿Seguro que deseas eliminarlo junto con todos los chistes?`)) {
          this.languageService.deleteWithJokes(id).subscribe({
            next: () => {
              this.loadAllLanguages();
            },
            error: (err) => {
              this.errorMsg = err.error ? err.error.error : 'Error al eliminar el idioma.';
            }
          });
        }
      },
      error: (err) => {
        this.errorMsg = 'Error al contar los chistes asociados: ' + err.message;
      }
    });
  }

  removeLanguageFromJokes(id: number): void {
    this.languageService.countJokesByLanguage(id).subscribe({
      next: (data) => {
        const jokesCount = data.jokesCount;

        if (confirm(`Este idioma tiene ${jokesCount} chistes asociados. ¿Seguro que deseas eliminar el idioma y dejar los chistes con idioma null?`)) {
          this.languageService.removeFromJokes(id).subscribe({
            next: () => {
              this.loadAllLanguages();
            },
            error: (err) => {
              this.errorMsg = err.error ? err.error.error : 'Error al eliminar el idioma.';
            }
          });
        }
      },
      error: (err) => {
        this.errorMsg = 'Error al contar los chistes asociados: ' + err.message;
      }
    });
  }
}
