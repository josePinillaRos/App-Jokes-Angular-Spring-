import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';

import { FlagsService, FlagsDTO } from '../flags.service';

@Component({
  standalone: true,
  selector: 'app-flags-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css'],
  imports: [CommonModule]
})
export class DetailComponent implements OnInit {

  flag: FlagsDTO | null = null;
  errorMsg: string | null = null;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private flagsService: FlagsService
  ) {}

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.loadFlag(id);
  }

  loadFlag(id: number): void {
    this.flagsService.getById(id).subscribe({
      next: (data) => {
        this.flag = data; // data es un FlagsDTO con {id, name}
      },
      error: (err) => {
        this.errorMsg = 'Error al cargar la flag: ' + err.message;
      }
    });
  }

  goBack(): void {
    this.router.navigate(['/flags']);
  }
}
