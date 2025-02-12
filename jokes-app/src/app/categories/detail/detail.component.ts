import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';

import { CategoriesService, CategoriesDTO } from '../categories.service';

@Component({
  standalone: true,
  selector: 'app-categories-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css'],
  imports: [CommonModule, RouterModule]
})
export class DetailComponent implements OnInit {

  category: CategoriesDTO | null = null;
  errorMsg: string | null = null;

  constructor(
    private route: ActivatedRoute,
    private categoriesService: CategoriesService,
    private router: Router
  ) {}

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.loadCategory(id);
  }

  loadCategory(id: number): void {
    this.categoriesService.getById(id).subscribe({
      next: (data: CategoriesDTO) => {
        this.category = data;
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar la categoría: ' + err.message;
      }
    });
  }

  goBack(): void {
    this.router.navigate(['/categories']);
  }
}
