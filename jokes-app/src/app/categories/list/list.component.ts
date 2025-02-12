import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

import { CategoriesService, CategoriesDTO } from '../categories.service';

@Component({
  standalone: true,
  selector: 'app-categories-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css'],
  imports: [CommonModule, RouterLink]
})
export class ListComponent implements OnInit {
  categories: CategoriesDTO[] = [];
  errorMsg: string | null = null;

  constructor(private categoriesService: CategoriesService) {}

  ngOnInit(): void {
    this.loadAllCategories();
  }

  loadAllCategories(): void {
    this.categoriesService.getAll().subscribe({
      next: (data) => {
        this.categories = data;
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar las categorías: ' + err.message;
      }
    });
  }

  deleteCategoryWithJokes(id: number): void {
    this.categoriesService.countJokesByCategory(id).subscribe({
      next: (data) => {
        const jokesCount = data.jokesCount;

        if (confirm(`Esta categoría tiene ${jokesCount} chistes asociados. ¿Seguro que deseas eliminarla junto con todos los chistes?`)) {
          this.categoriesService.deleteWithJokes(id).subscribe({
            next: () => {
              this.loadAllCategories();
            },
            error: (err) => {
              this.errorMsg = err.error ? err.error.error : 'Error al eliminar la categoría.';
            }
          });
        }
      },
      error: (err) => {
        this.errorMsg = 'Error al contar los chistes asociados: ' + err.message;
      }
    });
  }

  removeCategoryFromJokes(id: number): void {
    this.categoriesService.countJokesByCategory(id).subscribe({
      next: (data) => {
        const jokesCount = data.jokesCount;

        if (confirm(`Esta categoría tiene ${jokesCount} chistes asociados. ¿Seguro que deseas eliminar la categoría y dejar los chistes con categoría null?`)) {
          this.categoriesService.removeFromJokes(id).subscribe({
            next: () => {
              this.loadAllCategories();
            },
            error: (err) => {
              this.errorMsg = err.error ? err.error.error : 'Error al eliminar la categoría.';
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
