import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface FlagsDTO {
  id: number;
  name: string;
}

@Injectable({
  providedIn: 'root'
})
export class FlagsService {

  private baseUrl = 'http://localhost:8080/api/flags';

  constructor(private http: HttpClient) {}

  getAll(): Observable<FlagsDTO[]> {
    return this.http.get<FlagsDTO[]>(this.baseUrl);
  }

  getById(id: number): Observable<FlagsDTO> {
    return this.http.get<FlagsDTO>(`${this.baseUrl}/${id}`);
  }

  create(flag: any): Observable<any> {
    return this.http.post<any>(this.baseUrl, flag);
  }

  update(id: number, flag: any): Observable<any> {
    return this.http.put<any>(`${this.baseUrl}/${id}`, flag);
  }

  delete(id: number): Observable<any> {
    return this.http.delete<any>(`${this.baseUrl}/${id}`);
  }

  countJokesByFlag(flagId: number): Observable<{ jokesCount: number }> {
    return this.http.get<{ jokesCount: number }>(`${this.baseUrl}/${flagId}/count-jokes`);
  }  
}
