import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SidebarSimilarPostComponent } from './sidebar-similar-post.component';

describe('SidebarSimilarPostComponent', () => {
  let component: SidebarSimilarPostComponent;
  let fixture: ComponentFixture<SidebarSimilarPostComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SidebarSimilarPostComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SidebarSimilarPostComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
