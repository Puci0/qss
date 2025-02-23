import { Component } from '@angular/core';
import { MatCardModule } from '@angular/material/card';

@Component({
  selector: 'app-home-page',
  templateUrl: './home-page.component.html',
  styleUrls: ['./home-page.component.scss']
})
export class HomePageComponent {
  posts = [
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Jan Kowalski',
      title: "Usługi z zakresu inżynierii oprogramowania",
      category: 'Programowanie',
      description: "Oferuję usługi inżynierii oprogramowania, tworzenie aplikacji i systemów.",
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: "Naprawa komputerów",
      category: 'Technologia',
      description: "Specjalizuję się w naprawie komputerów, diagnostyce i konserwacji sprzętu elektronicznego.",
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: "Oferuję kursy online z zakresu programowania",
      category: 'Technologia',
      description: "Oferuję konsultacje zdrowotne i porady dotyczące zdrowia psychicznego.",
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: 'Ciekawostki o Angularze',
      category: 'Technologia',
      description: 'Opis posta o ciekawostkach.',
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: "Oferuję kursy online z zakresu programowania",
      category: 'Technologia',
      description: "Oferuję konsultacje zdrowotne i porady dotyczące zdrowia psychicznego.",
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: 'Ciekawostki o Angularze',
      category: 'Technologia',
      description: 'Opis posta o ciekawostkach.',
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: "Oferuję kursy online z zakresu programowania",
      category: 'Technologia',
      description: "Oferuję konsultacje zdrowotne i porady dotyczące zdrowia psychicznego.",
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: 'Ciekawostki o Angularze',
      category: 'Technologia',
      description: 'Opis posta o ciekawostkach.',
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: "Oferuję kursy online z zakresu programowania",
      category: 'Technologia',
      description: "Oferuję konsultacje zdrowotne i porady dotyczące zdrowia psychicznego.",
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: 'Ciekawostki o Angularze',
      category: 'Technologia',
      description: 'Opis posta o ciekawostkach.',
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: "Oferuję kursy online z zakresu programowania",
      category: 'Technologia',
      description: "Oferuję konsultacje zdrowotne i porady dotyczące zdrowia psychicznego.",
      createdAt: new Date(),
    },
    {
      avatarUrl: 'https://via.placeholder.com/40',
      name: 'Anna Nowak',
      title: 'Ciekawostki o Angularze',
      category: 'Technologia',
      description: 'Opis posta o ciekawostkach.',
      createdAt: new Date(),
    }
  ];

}

