import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';

import { LanguageService, LanguageDTO } from '../language.service';

@Component({
  standalone: true,
  selector: 'app-language-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css'],
  imports: [CommonModule, FormsModule, RouterModule],
})
export class EditComponent implements OnInit {
  languageId!: number; // ID que obtenemos de la ruta
  errorMsg: string | null = null;

  // Formulario para editar el idioma
  languageForm = {
    name: '',
    code: '',
  };

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private languageService: LanguageService
  ) {}

  ngOnInit(): void {
    this.languageId = Number(this.route.snapshot.paramMap.get('id'));
    this.loadLanguage(this.languageId);
  }

  loadLanguage(id: number): void {
    this.languageService.getById(id).subscribe({
      next: (data: LanguageDTO) => {
        this.languageForm.name = data.name;
        this.languageForm.code = data.code;
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar el idioma: ' + err.message;
      },
    });
  }

  updateLanguage(): void {
    if (!this.validateForm()) {
      alert('El formulario tiene errores. Por favor, corrige los campos.');
      return;
    }

    const body = {
      name: this.languageForm.name,
      code: this.languageForm.code,
    };

    this.languageService.update(this.languageId, body).subscribe({
      next: () => {
        this.router.navigate(['/languages']);
      },
      error: (err) => {
        this.errorMsg = err.error
          ? err.error.error
          : 'Error al actualizar el idioma.';
      },
    });
  }

  validateForm(): boolean {
    if (!this.languageForm.name.trim()) {
      this.errorMsg = 'El nombre no puede estar vacío.';
      return false;
    }
    if (!this.languageForm.code.trim() || !/^[A-Za-z]{2}$/.test(this.languageForm.code)) {
      this.errorMsg =
        'El código debe contener exactamente dos letras.';
      return false;
    }
    this.errorMsg = null; // Si todo es válido, limpiamos el error.
    return true;
  }
}
