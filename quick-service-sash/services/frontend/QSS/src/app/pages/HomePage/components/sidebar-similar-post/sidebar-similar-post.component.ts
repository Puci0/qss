import {Component, Input} from '@angular/core';

@Component({
  selector: 'app-sidebar-similar-post',
  templateUrl: './sidebar-similar-post.component.html',
  styleUrls: ['./sidebar-similar-post.component.scss']
})
export class SidebarSimilarPostComponent {
  @Input() post!: {
    avatarUrl: string;
    name: string;
    title: string;
    category: string;
    description: string;
    createdAt: Date;
  };

}
