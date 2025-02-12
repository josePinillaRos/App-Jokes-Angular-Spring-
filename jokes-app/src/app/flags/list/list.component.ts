import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

import { FlagsService, FlagsDTO } from '../flags.service';

@Component({
  standalone: true,
  selector: 'app-flags-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css'],
  imports: [CommonModule, RouterLink]
})
export class ListComponent implements OnInit {

  flags: FlagsDTO[] = [];
  errorMsg: string | null = null;

  constructor(private flagsService: FlagsService) {}

  ngOnInit(): void {
    this.loadAllFlags();
  }

  loadAllFlags(): void {
    this.flagsService.getAll().subscribe({
      next: (data) => {
        this.flags = data; // data es un array de FlagsDTO
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar las flags: ' + err.message;
      }
    });
  }

  deleteFlag(flagId: number): void {
  // Primero, obtener el número de chistes asociados al flag
  this.flagsService.countJokesByFlag(flagId).subscribe({
    next: (data) => {
      const jokeCount = data.jokesCount;

      // Mostrar confirmación con el número de chistes asociados
      if (confirm(`Este flag está asociado a ${jokeCount} chistes. ¿Estás seguro de eliminarlo?`)) {
        // Proceder con la eliminación si el usuario confirma
        this.flagsService.delete(flagId).subscribe({
          next: () => {
            this.loadAllFlags(); // Recargar la lista de flags
          },
          error: (err) => {
            this.errorMsg = err.error ? err.error.error : 'Error al eliminar el flag.';
          }
        });
      }
    },
    error: (err) => {
      this.errorMsg = err.error ? err.error.error : 'Error al contar los chistes asociados al flag.';
    }
  });
}
}
