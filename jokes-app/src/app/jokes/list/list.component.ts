import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { JokesService, JokesNamesDTO } from '../jokes.service';

@Component({
  standalone: true,
  imports: [CommonModule, RouterLink],
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {

  jokes: JokesNamesDTO[] = [];
  errorMsg: string | null = null;

  // Paginación
  pageSize = 15;    // Muestra 6 chistes por página (ajusta a tu gusto)
  currentPage = 1; // Página actual (empieza en 1)

  constructor(private jokesService: JokesService) {}

  ngOnInit(): void {
    this.loadAll();
  }

  loadAll(): void {
    this.jokesService.getAll().subscribe({
      next: (data) => {
        // Ordena por ID, categoría, o cualquier criterio relevante
        this.jokes = data.sort((a, b) => a.id - b.id); // Cambia `id` por otro campo si es necesario
      },
      error: (err) => (this.errorMsg = 'Error al cargar los chistes: ' + err.message),
    });
  }

  deleteJoke(id: number) {
    if (confirm('¿Seguro de eliminar este chiste?')) {
      this.jokesService.delete(id).subscribe({
        next: () => this.loadAll(),
        error: (err) => this.errorMsg = err.message
      });
    }
  }

  // Getter: Calcula cuántas páginas totales hay
  get totalPages(): number {
    return Math.ceil(this.jokes.length / this.pageSize);
  }

  // Obtiene el subset de jokes que se muestran en la página actual
  get paginatedJokes(): JokesNamesDTO[] {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    return this.jokes.slice(startIndex, endIndex);
  }

  get visiblePages(): number[] {
    const maxVisiblePages = 5; // Número máximo de páginas visibles a la vez
    const pages: number[] = [];
    const total = this.totalPages;
  
    let startPage = Math.max(this.currentPage - Math.floor(maxVisiblePages / 2), 1);
    let endPage = Math.min(startPage + maxVisiblePages - 1, total);
  
    if (endPage - startPage + 1 < maxVisiblePages) {
      startPage = Math.max(endPage - maxVisiblePages + 1, 1);
    }
  
    for (let i = startPage; i <= endPage; i++) {
      pages.push(i);
    }
  
    return pages;
  }

  // Cambia a la página anterior
  prevPage(): void {
    if (this.currentPage > 1) {
      this.currentPage--;
    }
  }

  // Cambia a la página siguiente
  nextPage(): void {
    if (this.currentPage < this.totalPages) {
      this.currentPage++;
    }
  }

  // Selecciona una página directamente
  goToPage(page: number): void {
    if (page >= 1 && page <= this.totalPages) {
      this.currentPage = page;
    }
  }
}
