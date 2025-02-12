import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

/**
 * Representa un DTO de actualización para un Joke.
 * Coincide con lo que espera tu backend en el PUT.
 */
export interface JokeUpdateDTO {
  id: number | null;
  categoryId: number | null;
  languageId: number | null;
  typeId: number | null;
  text1: string;
  text2: string;
  flagses: number[]; // IDs de los flags seleccionados
}

/**
 * Representa la respuesta de GET /jokes/{id}, 
 * que podría ser un JokesDTO con nombres de cat/lang/type/flags.
 */
export interface JokesNamesDTO {
  id: number;
  categoryName: string | null;
  languageName: string | null;
  typeName: string | null;
  text1: string;
  text2: string;
  flagsNames: string[];
}


@Injectable({
  providedIn: 'root',
})
export class JokesService {
  private baseUrl = 'http://localhost:8080/api/jokes';
  private categoriesUrl = 'http://localhost:8080/api/categories';
  private languagesUrl = 'http://localhost:8080/api/languages';
  private typesUrl = 'http://localhost:8080/api/types';
  private flagsUrl = 'http://localhost:8080/api/flags';

  constructor(private http: HttpClient) {}

  // GET /jokes
  getAll(): Observable<JokesNamesDTO[]> {
    return this.http.get<JokesNamesDTO[]>(this.baseUrl);
  }

  // GET /jokes/{id}
  getById(id: number): Observable<JokesNamesDTO> {
    return this.http.get<JokesNamesDTO>(`${this.baseUrl}/${id}`);
  }

  // POST /jokes
  create(jokeBody: any): Observable<any> {
    return this.http.post<any>(this.baseUrl, jokeBody);
  }

  // PUT /jokes/{id}, con nuestro JokeUpdateDTO
  update(id: number, jokeDTO: JokeUpdateDTO): Observable<any> {
    return this.http.put<any>(`${this.baseUrl}/${id}`, jokeDTO);
  }

  // DELETE /jokes/{id}
  delete(id: number): Observable<any> {
    return this.http.delete<any>(`${this.baseUrl}/${id}`);
  }

  // Obtener listas de categorías, idiomas, tipos, flags
  getCategories(): Observable<any[]> {
    return this.http.get<any[]>(this.categoriesUrl);
  }

  getLanguages(): Observable<any[]> {
    return this.http.get<any[]>(this.languagesUrl);
  }

  getTypes(): Observable<any[]> {
    return this.http.get<any[]>(this.typesUrl);
  }

  getFlags(): Observable<any[]> {
    return this.http.get<any[]>(this.flagsUrl);
  }
}
