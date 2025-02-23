import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {BehaviorSubject, Observable} from 'rxjs';
import{ environment } from "../environments/environment";

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private apiUrl = environment.apiUrl;

  private sessionKey = 'isLoggedIn';

  constructor(private http: HttpClient) {}

  login(credentials: { email: string; password: string }): Observable<any> {
    return this.http.post(`${this.apiUrl}/users/login`, credentials, {
      headers: { 'Content-Type': 'application/json' }
    });
  }

  register(userData: { name: string; surname: string; email: string; password: string }): Observable<any> {
    return this.http.post(`${this.apiUrl}/users/register`, userData);
  }

  private isLoggedInSubject = new BehaviorSubject<boolean>(this.isLoggedIn());
  isLoggedIn$ = this.isLoggedInSubject.asObservable();

  setLoggedIn(value: boolean): void {
    sessionStorage.setItem(this.sessionKey, value.toString());
    this.isLoggedInSubject.next(value);
  }

  isLoggedIn(): boolean {
    return sessionStorage.getItem(this.sessionKey) === 'true';
  }

  clearSession(): void {
    sessionStorage.removeItem(this.sessionKey);
    this.isLoggedInSubject.next(false);
  }

}
