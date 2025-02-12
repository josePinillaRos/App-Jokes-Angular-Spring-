import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';

import { JokesService, JokesNamesDTO } from '../jokes.service';

@Component({
  standalone: true,
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css'],
  imports: [CommonModule]
})
export class DetailComponent implements OnInit {

  joke: JokesNamesDTO | null = null;
  errorMsg: string | null = null;

  constructor(
    private route: ActivatedRoute,
    private jokesService: JokesService,
    private router: Router
  ) { }

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.loadJoke(id);
  }

  loadJoke(id: number) {
    this.jokesService.getById(id).subscribe({
      next: (data) => {
        this.joke = {
          ...data,
          categoryName: data.categoryName || 'N/A',
          languageName: data.languageName || 'N/A',
          typeName: data.typeName || 'N/A',
          flagsNames: data.flagsNames && data.flagsNames.length > 0 ? data.flagsNames : []
        };
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar el chiste: ' + err.message;
      }
    });
  }

  goBack() {
    this.router.navigate(['/jokes']);
  }
}
