import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {UsersComponent} from "./components/users/users.component";
import {LoginPageComponent} from "./pages/LoginPage/components/login-page/login-page.component";
import {AppComponent} from "./app.component";
import {LoginRegisterPageComponent} from "./pages/LoginPage/login-register-page/login-register-page.component";
import {HomePageComponent} from "./pages/HomePage/home-page/home-page.component";
import {RegisterPageComponent} from "./pages/LoginPage/components/register-page/register-page.component";
import {AuthGuard} from "./services/auth.guard";
import { PostPageComponent } from './pages/PostPage/post-page.component';

const routes: Routes = [
  { path: 'login', component: LoginPageComponent, canActivate: [AuthGuard]},
  { path: 'register', component: RegisterPageComponent, canActivate: [AuthGuard]},
  { path: 'home', component: HomePageComponent},
  { path: '', redirectTo: 'home', pathMatch: 'full'},
  {path: 'postpage',component: PostPageComponent},

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

