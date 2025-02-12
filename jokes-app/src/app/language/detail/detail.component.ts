import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';

import { LanguageService, LanguageDTO } from '../language.service';

@Component({
  standalone: true,
  selector: 'app-language-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css'],
  imports: [CommonModule, RouterModule],
})
export class DetailComponent implements OnInit {
  language: LanguageDTO | null = null; // Detalles del idioma
  errorMsg: string | null = null;

  constructor(
    private route: ActivatedRoute,
    private languageService: LanguageService,
    private router: Router
  ) {}

  ngOnInit(): void {
    const languageId = Number(this.route.snapshot.paramMap.get('id'));
    this.loadLanguage(languageId);
  }

  loadLanguage(id: number): void {
    this.languageService.getById(id).subscribe({
      next: (data: LanguageDTO) => {
        this.language = data;
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar el idioma: ' + err.message;
      },
    });
  }

  goBack(): void {
    this.router.navigate(['/languages']);
  }
}
