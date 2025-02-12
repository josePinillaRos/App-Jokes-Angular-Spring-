import { Component } from '@angular/core';
import { RouterLink, RouterOutlet } from '@angular/router';

@Component({
  standalone: true,
  imports: [RouterOutlet, RouterLink], // Permite usar <router-outlet> y [routerLink]
  selector: 'app-root',
  template: `
    <nav style="
      background: #000;
      padding: 1rem;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      display: flex;
      justify-content: center;
    ">
      <a 
        routerLink="/jokes" 
        style="
          margin-right: 1rem; 
          color: white; 
          text-decoration: none; 
          font-weight: bold; 
          padding: 0.5rem 1rem;
          border-radius: 4px;
          transition: background-color 0.3s ease;
        "
        onmouseover="this.style.backgroundColor='#333'"
        onmouseout="this.style.backgroundColor='transparent'"
      >
        Jokes
      </a>
      <a 
        routerLink="/flags" 
        style="
          margin-right: 1rem; 
          color: white; 
          text-decoration: none; 
          font-weight: bold; 
          padding: 0.5rem 1rem;
          border-radius: 4px;
          transition: background-color 0.3s ease;
        "
        onmouseover="this.style.backgroundColor='#333'"
        onmouseout="this.style.backgroundColor='transparent'"
      >
        Flags
      </a>
      <a 
        routerLink="/categories" 
        style="
          margin-left: 1rem; 
          color: white; 
          text-decoration: none; 
          font-weight: bold; 
          padding: 0.5rem 1rem;
          border-radius: 4px;
          transition: background-color 0.3s ease;
        "
        onmouseover="this.style.backgroundColor='#333'"
        onmouseout="this.style.backgroundColor='transparent'"
      >
        Categories
      </a>
      <a 
        routerLink="/languages" 
        style="
          margin-left: 1rem; 
          color: white; 
          text-decoration: none; 
          font-weight: bold; 
          padding: 0.5rem 1rem;
          border-radius: 4px;
          transition: background-color 0.3s ease;
        "
        onmouseover="this.style.backgroundColor='#333'"
        onmouseout="this.style.backgroundColor='transparent'"
      >
        Languages
      </a>
    </nav>
    <div style="margin: 1rem; padding: 1rem; background: #f4f4f9; border-radius: 8px;">
      <router-outlet></router-outlet>
    </div>
  `
})
export class AppComponent {
  title(title: any) {
    throw new Error('Method not implemented.');
  }
}
