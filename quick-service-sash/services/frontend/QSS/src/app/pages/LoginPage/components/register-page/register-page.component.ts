import { Component } from '@angular/core';
import {AbstractControl, FormBuilder, FormGroup, Validators} from '@angular/forms';
import { AuthService } from "../../../../services/auth.service";
import { Router } from '@angular/router';

@Component({
  selector: 'app-register-page',
  templateUrl: './register-page.component.html',
  styleUrls: ['./register-page.component.scss'],
})
export class RegisterPageComponent {
  registerForm: FormGroup;
  errorMessage: string = '';

  constructor(private fb: FormBuilder, private authService: AuthService, private router: Router) {
    this.registerForm = this.fb.group({
      name: ['', [Validators.required, this.nameAndSurnameValidator]],
      surname: ['', [Validators.required, this.nameAndSurnameValidator]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(5)]],
      confirmPassword: ['', [Validators.required]],
    }, {
      validators: this.passwordMatchValidator
    });
  }

  passwordMatchValidator(formGroup: FormGroup) {
    return formGroup.get('password')?.value === formGroup.get('confirmPassword')?.value
      ? null
      : { mismatch: true };
  }

  nameAndSurnameValidator(control: AbstractControl) {
    const value = control.value;

    if (!value) {
      return null;
    }

    if (value.charAt(0) !== value.charAt(0).toUpperCase()) {
      return {firstLetterUpperCase: true};
    }

    if (value.slice(1) !== value.slice(1).toLowerCase()) {
      return {restLettersLowerCase: true};
    }

    if (!/^[a-zA-Z]+$/.test(value)) {
      return {onlyLetters: true};
    }

    return null;
  }

  onSubmit() {
    if (this.registerForm.valid) {
      this.authService.register(this.registerForm.value).subscribe({
        next: (response) => {
          console.log('Registration successful:', response);
          this.router.navigate(['login']);
        },
        error: (error) => {
          console.error('Registration error:', error);
          this.errorMessage = 'Registration failed. Please try again.';
        },
      });
    }
  }
}
