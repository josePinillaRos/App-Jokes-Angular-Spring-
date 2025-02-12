import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';

import { LanguageService } from '../language.service';

@Component({
  standalone: true,
  selector: 'app-language-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css'],
  imports: [CommonModule, FormsModule, RouterModule],
})
export class CreateComponent {
  errorMsg: string | null = null;

  // Formulario del lenguaje
  languageForm = {
    name: '',
    code: '',
  };

  constructor(private languageService: LanguageService, private router: Router) {}

  createLanguage(): void {
    // Validación: Nombre no vacío
    if (!this.languageForm.name.trim()) {
      this.errorMsg = 'El nombre del idioma no puede estar vacío.';
      return;
    }

    // Validación: Código debe ser exactamente dos letras
    const codeRegex = /^[a-zA-Z]{2}$/;
    if (!codeRegex.test(this.languageForm.code)) {
      this.errorMsg =
        'El código del idioma debe contener exactamente dos letras.';
      return;
    }

    // Si pasa las validaciones, proceder a crear el idioma
    this.languageService.create(this.languageForm).subscribe({
      next: () => {
        this.router.navigate(['/languages']);
      },
      error: (err) => {
        this.errorMsg = err.error
          ? err.error.error
          : 'Error al crear el idioma.';
      },
    });
  }
}
