import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';

import { CategoriesService, CategoriesDTO } from '../categories.service';

@Component({
  standalone: true,
  selector: 'app-categories-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css'],
  imports: [CommonModule, FormsModule, RouterModule]
})
export class EditComponent implements OnInit {

  categoryId!: number; // ID que obtenemos de la ruta
  errorMsg: string | null = null;

  // Form para la categoría
  categoryForm = {
    name: ''
  };

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private categoriesService: CategoriesService
  ) {}

  ngOnInit(): void {
    this.categoryId = Number(this.route.snapshot.paramMap.get('id'));
    this.loadCategory(this.categoryId);
  }

  loadCategory(id: number): void {
    this.categoriesService.getById(id).subscribe({
      next: (data: CategoriesDTO) => {
        this.categoryForm.name = data.name;
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar la categoría: ' + err.message;
      }
    });
  }

  updateCategory(): void {
    // Validar que el campo no esté vacío
    if (!this.categoryForm.name.trim()) {
      this.errorMsg = 'El nombre de la categoría no puede estar vacío.';
      return;
    }

    const body = {
      name: this.categoryForm.name
    };

    this.categoriesService.update(this.categoryId, body).subscribe({
      next: () => {
        this.router.navigate(['/categories']);
      },
      error: (err) => {
        this.errorMsg = err.error ? err.error.error : 'Error al actualizar la categoría.';
      }
    });
  }
}
