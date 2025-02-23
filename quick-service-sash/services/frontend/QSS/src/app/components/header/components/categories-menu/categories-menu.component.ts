import {Component, OnInit} from '@angular/core';
import {CategoryService} from "../../../../services/category.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-categories-menu',
  templateUrl: './categories-menu.component.html',
  styleUrls: ['./categories-menu.component.scss']
})
export class CategoriesMenuComponent implements OnInit{
categories: any[] = [
  {
    "name": "Informatyka",
    "subcategories": ["Programowanie", "Bazy danych", "AI"]
  },
  {
    "name": "Zdrowie",
    "subcategories": ["Medycyna", "Sport", "Psychologia"]
  },
  {
    "name": "Mechanika",
    "subcategories": ["Samochody", "Maszyny"]
  }
];

constructor(private categoryService: CategoryService, private router: Router) {
}

ngOnInit() {
  this.categoryService.getCategories().subscribe((data)=> {
    this.categories = data;
  })
}


  navigateToCategory(category: any) {
    this.router.navigate(['/category', category.name]);
  }

  navigateToSubcategory(category: any, subcategory: any) {
    this.router.navigate(['/category', category.name, subcategory]);
  }

}

