import {Component, Input} from '@angular/core';
import { MatCardModule } from '@angular/material/card';

@Component({
  selector: 'app-post-announcement',
  templateUrl: './post-announcement.component.html',
  styleUrls: ['./post-announcement.component.scss']
})
export class PostAnnouncementComponent {
  @Input() post!: {
    avatarUrl: string;
    name: string;
    title: string;
    category: string;
    description: string;
    createdAt: Date;
  };

}
