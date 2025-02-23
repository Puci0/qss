import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import { AuthService } from "../../../../services/auth.service";
import {Router} from "@angular/router";
import {DataService} from "../../../../services/data.service";

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrls: ['./login-page.component.scss']
})
export class LoginPageComponent implements OnInit{
  users: any[] = [];
  userData: any;
  loginForm: FormGroup;
  errorMessage: string = '';
  isLoggedIn: boolean = false;

  constructor(private fb: FormBuilder, private authService: AuthService, private router: Router, private dataService: DataService) {
    const navigation = this.router.getCurrentNavigation();
    this.userData = navigation?.extras.state?.['userData'];

    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(5)]],
    });
  }

  onSubmit() {
    if (this.loginForm.valid) {
      console.log('Form data:', this.loginForm.value);

      this.authService.login(this.loginForm.value).subscribe({
        next: (response) => {
          console.log('Login successful:', response);
          this.isLoggedIn = true;
          console.log('User logged in:', this.isLoggedIn);
          this.authService.setLoggedIn(true);
          this.router.navigate(['/']);
        },
        error: (error) => {
          console.error('Login error:', error);
          this.errorMessage = 'Invalid login credentials';
          this.isLoggedIn = false;
        },
      });
    } else {
      this.errorMessage = "Required fields filled incorrectly"
      console.log('Form invalid:', this.loginForm);
    }
  }

  onLogout():void{
    this.authService.clearSession();
  }

  ngOnInit(): void {
    console.log(this.userData); // Wyświetla dane nawigacji (jeśli są)
  }

}
