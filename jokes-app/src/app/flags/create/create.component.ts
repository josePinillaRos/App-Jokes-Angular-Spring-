import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';

import { FlagsService } from '../flags.service';

@Component({
  standalone: true,
  selector: 'app-flags-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css'],
  imports: [CommonModule, FormsModule,RouterModule]
})
export class CreateComponent {

  // El backend (Spring Boot) espera un objeto {flag: string, jokeses?: ... } si usas la entidad
  // o { name: string } si esperas un DTO. Ajusta según tu API.
  // En tu caso, la entidad se llama "flag" (campo).
  // Ejemplo: {flag: ''}.
  flagForm = {
    flag: '' // Nombre que usas en la entidad
  };

  errorMsg: string | null = null;

  constructor(
    private flagsService: FlagsService,
    private router: Router
  ) {}

  createFlag(): void {
    this.flagsService.create(this.flagForm).subscribe({
      next: () => {
        this.router.navigate(['/flags']);
      },
      error: (err) => {
        this.errorMsg = err.error ? err.error.error : 'Error al crear la flag.';
      }
    });
  }
}

