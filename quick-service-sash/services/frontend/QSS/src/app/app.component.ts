import { Component } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import { environment} from "./environments/environment";
import {Router} from "@angular/router";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  apiUrl: string = environment.apiUrl;
  title = 'QuickServiceSash';
  constructor(private http: HttpClient, private router: Router) {
  }
  testConnection(){
    this.http.get(`${this.apiUrl}/users`).subscribe(
      (data) => {
        this.router.navigate(['/users'], { state: { userData: data } });
      },
      (error) => {
        console.error('Błąd przy pobieraniu danych:', error);
      }
    );
  }
}
