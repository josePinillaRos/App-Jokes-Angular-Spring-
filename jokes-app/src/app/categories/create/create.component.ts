import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { CategoriesService } from '../categories.service';

@Component({
  standalone: true,
  selector: 'app-categories-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css'],
  imports: [CommonModule, FormsModule, RouterModule]
})
export class CreateComponent {

  category = { name: '' };
  errorMsg: string | null = null;

  constructor(
    private categoriesService: CategoriesService,
    private router: Router
  ) {}

  createCategory(): void {
    // Verificar si el nombre está vacío o solo contiene espacios
    if (!this.category.name.trim()) {
      this.errorMsg = 'El nombre de la categoría es obligatorio.';
      return;
    }

    // Limpiar el mensaje de error antes de enviar la solicitud
    this.errorMsg = null;

    this.categoriesService.create(this.category).subscribe({
      next: () => this.router.navigate(['/categories']),
      error: (err) => {
        this.errorMsg = err.error ? err.error.error : 'Error al crear la categoría.';
      }
    });
  }
}

