import { Component } from '@angular/core';

@Component({
  selector: 'app-online-user-list',
  templateUrl: './online-user-list.component.html',
  styleUrls: ['./online-user-list.component.scss']
})
export class OnlineUserListComponent {
  users = [
    { firstName: 'Jan', lastName: 'Kowalski', avatar: 'https://placehold.co/40' },
    { firstName: 'Anna', lastName: 'Nowak', avatar: 'https://placehold.co/40' },
    { firstName: 'Piotr', lastName: 'Wiśniewski', avatar: 'https://placehold.co/40' },
  ];
}
