import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';

import { FlagsService, FlagsDTO } from '../flags.service';

@Component({
  standalone: true,
  selector: 'app-flags-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css'],
  imports: [CommonModule, FormsModule, RouterModule]
})
export class EditComponent implements OnInit {

  flagId!: number; // ID que obtenemos de la ruta
  errorMsg: string | null = null;

  // Form para la flag, con la propiedad "flag" (la que Spring reconoce).
  // Una vez que hagamos GET, la pasaremos aquí (ej. this.flagForm.flag = data.name)
  flagForm = {
    flag: ''
  };

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private flagsService: FlagsService
  ) {}

  ngOnInit(): void {
    this.flagId = Number(this.route.snapshot.paramMap.get('id'));
    this.loadFlag(this.flagId);
  }

  loadFlag(id: number): void {
    this.flagsService.getById(id).subscribe({
      next: (data: FlagsDTO) => {
        // data tiene { id, name } 
        // Nuestra API al hacer GET /flags/{id} retorna un FlagsDTO con "name".
        // La entidad en tu DB es "flag" para el nombre. Para editar, usaremos "flag".
        // Por lo tanto, igualamos: 
        this.flagForm.flag = data.name;
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar la flag: ' + err.message;
      }
    });
  }

  updateFlag(): void {
    // Armamos el objeto con la propiedad que tu backend reconoce. 
    // Asumimos que el backend pide { flag: "nuevo valor" } en el body.
    const body = {
      flag: this.flagForm.flag
    };

    this.flagsService.update(this.flagId, body).subscribe({
      next: () => {
        this.router.navigate(['/flags']);
      },
      error: (err) => {
        this.errorMsg = err.error ? err.error.error : 'Error al actualizar la flag.';
      }
    });
  }
}
