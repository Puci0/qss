import { Component } from '@angular/core';

@Component({
  selector: 'app-faq',
  templateUrl: './faq.component.html',
  styleUrls: ['./faq.component.scss'],
})
export class FAQComponent {
  faqItems = [
    {
      question: 'Jak mogę wystawić ogłoszenie na stronie?',
      answer: 'Aby wystawić ogłoszenie, należy zarejestrować się na stronie, wypełnić formularz dotyczący Twoich kwalifikacji i umiejętności, a następnie opublikować ogłoszenie.',
      open: false,
    },
    {
      question: 'Czy mogę edytować swoje ogłoszenie po jego wystawieniu?',
      answer: 'Tak, po zalogowaniu się na swoje konto, możesz edytować treść ogłoszenia, zmieniać swoje dane kontaktowe i modyfikować szczegóły dotyczące Twoich umiejętności.',
      open: false,
    },
    {
      question: 'Jak znaleźć odpowiedniego specjalistę?',
      answer: 'Możesz przeszukiwać ogłoszenia według kategorii umiejętności lub słów kluczowych, aby znaleźć specjalistów w danej dziedzinie. Możesz również przeglądać profile ogłoszeniodawców i skontaktować się bezpośrednio.',
      open: false,
    },
    {
      question: 'Czy mogę skontaktować się z ogłoszeniodawcą?',
      answer: 'Tak, po znalezieniu interesującego Cię ogłoszenia, możesz skontaktować się z jego autorem za pomocą formularza kontaktowego lub poprzez dane kontaktowe podane w ogłoszeniu.',
      open: false,
    },
    {
      question: 'Czy wystawienie ogłoszenia jest płatne?',
      answer: 'Wystawienie ogłoszenia na stronie jest darmowe. Możesz zamieścić swoje ogłoszenie bez żadnych opłat.',
      open: false,
    },
    {
      question: 'Czy mogę wystawić ogłoszenie w wielu dziedzinach?',
      answer: 'Tak, możesz wystawić kilka ogłoszeń, każde dotyczące innej dziedziny, w której posiadasz umiejętności. Każde ogłoszenie będzie miało oddzielną kategorię.',
      open: false,
    },
  ];

  toggleAnswer(item: any) {
    item.open = !item.open;
  }
}
