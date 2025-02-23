import { Component } from '@angular/core';

@Component({
  selector: 'app-post-page',
  templateUrl: './post-page.component.html',
  styleUrls: ['./post-page.component.scss']
})
export class PostPageComponent {
  post = {
    image: 'assets/profile1.jpg',
    name: 'Marek Jasiński',
    category: 'Specjalista IT',
    qualifications: 'Frontend, Backend, wsparcie technologiczne',
    content: 'Jestem doświadczonym programistą z wieloletnim doświadczeniem...',
    likes: 0 // Dodajemy licznik lajków dla posta
  };

  comments = [
    { author: 'Jan Kowalski', content: 'Świetne ogłoszenie!', likes: 0 },
    { author: 'Anna Nowak', content: 'Bardzo przydatne informacje!', likes: 0 }
  ];
  likes: number = 0; // Inicjalizacja licznikiem początkowym
  newComment: string = '';

  // Funkcja do lajkowania posta
  likePost() {
    this.post.likes++;
  }

  // Funkcja do lajkowania komentarzy
  likeComment(index: number) {
    this.comments[index].likes++;
  }

  // Funkcja do dodawania komentarzy
  addComment() {
    if (this.newComment.trim()) {
      this.comments.push({ author: 'Anonimowy Użytkownik', content: this.newComment, likes: 0 });
      this.newComment = ''; // Resetuj pole tekstowe
    }

  }

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
