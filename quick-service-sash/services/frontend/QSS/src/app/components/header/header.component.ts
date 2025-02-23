import { Component } from '@angular/core';
import {Router} from "@angular/router";
import {SearchService} from "../../services/search.service";
import {AuthService} from "../../services/auth.service";

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent {

  isLoggedIn: boolean = false;

  inputText: string = '';
  constructor(private router: Router, private searchService: SearchService, private authService: AuthService) {}

  ngOnInit(): void {
    this.authService.isLoggedIn$.subscribe((status: boolean) => {
      this.isLoggedIn = status;
    });
    this.isLoggedIn = this.authService.isLoggedIn();
  }

  login(): void {
    this.authService.setLoggedIn(true); // Zaloguj użytkownika
  }

  logout(): void{
    this.authService.clearSession();
  }

  onSearchBtn(): void
  {
    this.searchService.search(this.inputText).subscribe({
      next: (response) => {
        console.log('Wyniki wyszukiwania:', response);
      },
      error: (error) =>{
        console.log('Błąd wyszukiwania:', error);
      },
    });
  }


  public redirecToIndexPage(url?: string): void {
    this.router.navigate([url ?? '/' ]);
  }
}
