import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface CategoriesDTO {
  id: number;
  name: string;
}

@Injectable({
  providedIn: 'root'
})
export class CategoriesService {

  private baseUrl = 'http://localhost:8080/api/categories';

  constructor(private http: HttpClient) {}

  getAll(): Observable<CategoriesDTO[]> {
    return this.http.get<CategoriesDTO[]>(this.baseUrl);
  }

  getById(id: number): Observable<CategoriesDTO> {
    return this.http.get<CategoriesDTO>(`${this.baseUrl}/${id}`);
  }

  create(category: any): Observable<any> {
    return this.http.post<any>(this.baseUrl, category);
  }

  update(id: number, category: any): Observable<any> {
    return this.http.put<any>(`${this.baseUrl}/${id}`, category);
  }

  deleteWithJokes(id: number): Observable<any> {
    return this.http.delete<any>(`${this.baseUrl}/${id}/delete-with-jokes`);
  }

  removeFromJokes(id: number): Observable<any> {
    return this.http.delete<any>(`${this.baseUrl}/${id}/remove-from-jokes`);
  }
  countJokesByCategory(id: number): Observable<{ categoryId: number; jokesCount: number }> {
    return this.http.get<{ categoryId: number; jokesCount: number }>(`${this.baseUrl}/${id}/count-jokes`);
  }
}
