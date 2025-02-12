import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface LanguageDTO {
  id: number;
  name: string;
  code: string;
}

@Injectable({
  providedIn: 'root'
})
export class LanguageService {
  private baseUrl = 'http://localhost:8080/api/languages';

  constructor(private http: HttpClient) {}

  getAll(): Observable<LanguageDTO[]> {
    return this.http.get<LanguageDTO[]>(this.baseUrl);
  }

  getById(id: number): Observable<LanguageDTO> {
    return this.http.get<LanguageDTO>(`${this.baseUrl}/${id}`);
  }

  create(language: any): Observable<any> {
    return this.http.post<any>(this.baseUrl, language);
  }

  update(id: number, language: any): Observable<any> {
    return this.http.put<any>(`${this.baseUrl}/${id}`, language);
  }

  deleteWithJokes(id: number): Observable<any> {
    return this.http.delete<any>(`${this.baseUrl}/${id}/delete-with-jokes`);
  }

  removeFromJokes(id: number): Observable<any> {
    return this.http.delete<any>(`${this.baseUrl}/${id}/remove-from-jokes`);
  }

  countJokesByLanguage(id: number): Observable<{ jokesCount: number }> {
    return this.http.get<{ jokesCount: number }>(`${this.baseUrl}/${id}/count-jokes`);
  }
}
