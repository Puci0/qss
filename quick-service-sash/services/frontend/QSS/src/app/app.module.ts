import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import {HttpClientModule} from "@angular/common/http";
import { UsersComponent } from './components/users/users.component';
import { LoginPageComponent } from './pages/LoginPage/components/login-page/login-page.component';
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {MatCardModule} from "@angular/material/card";
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {MatButtonModule} from "@angular/material/button";
import { LoginRegisterPageComponent } from './pages/LoginPage/login-register-page/login-register-page.component';
import { RegisterPageComponent } from './pages/LoginPage/components/register-page/register-page.component';
import {MatIconModule} from "@angular/material/icon";
import { CategoriesMenuComponent } from './components/header/components/categories-menu/categories-menu.component';
import {MatMenuModule} from "@angular/material/menu";
import { HomePageComponent} from "./pages/HomePage/home-page/home-page.component";
import { FrameComponent } from './pages/HomePage/components/frame/frame.component';
import { ProfilePageComponent } from './pages/ProfilePage/profile-page/profile-page.component';
import { PostAnnouncementComponent } from './pages/HomePage/components/post-announcement/post-announcement.component';
import { SidebarSimilarPostComponent } from './pages/HomePage/components/sidebar-similar-post/sidebar-similar-post.component';
import { OnlineUserListComponent } from './pages/HomePage/components/online-user-list/online-user-list.component';
import {MatListModule} from "@angular/material/list";
import { FAQComponent } from './pages/HomePage/components/FAQ/faq.component';
import { PostPageComponent } from './pages/PostPage/post-page.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    UsersComponent,
    LoginPageComponent,
    RegisterPageComponent,
    LoginRegisterPageComponent,
    RegisterPageComponent,
    CategoriesMenuComponent,
    HomePageComponent,
    FrameComponent,
    ProfilePageComponent,
    PostAnnouncementComponent,
    SidebarSimilarPostComponent,
    OnlineUserListComponent,
    FAQComponent,
    PostPageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatIconModule,
    FormsModule,
    MatMenuModule,
    MatListModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
