import { Routes } from '@angular/router';

// Importamos los componentes standalone
import { ListComponent as JokesListComponent } from './jokes/list/list.component';
import { DetailComponent as JokesDetailComponent } from './jokes/detail/detail.component';
import { CreateComponent as JokesCreateComponent } from './jokes/create/create.component';
import { EditComponent as JokesEditComponent } from './jokes/edit/edit.component';

import { ListComponent as FlagsListComponent } from './flags/list/list.component';
import { DetailComponent as FlagsDetailComponent } from './flags/detail/detail.component';
import { CreateComponent as FlagsCreateComponent } from './flags/create/create.component';
import { EditComponent as FlagsEditComponent } from './flags/edit/edit.component';

import { ListComponent as CategoriesListComponent } from './categories/list/list.component';
import { DetailComponent as CategoriesDetailComponent } from './categories/detail/detail.component';
import { CreateComponent as CategoriesCreateComponent } from './categories/create/create.component';
import { EditComponent as CategoriesEditComponent } from './categories/edit/edit.component';


import { ListComponent as LanguageListComponent } from './language/list/list.component';
import { CreateComponent as LanguageCreateComponent } from './language/create/create.component';
import { EditComponent as LanguageEditComponent } from './language/edit/edit.component';
import { DetailComponent as LanguageDetailComponent } from './language/detail/detail.component';

export const routes: Routes = [
  { path: '', redirectTo: 'jokes', pathMatch: 'full' },


    // Language routes
    { path: 'languages', children: [
      { path: '', component: LanguageListComponent },
      { path: 'create', component: LanguageCreateComponent },
      { path: 'edit/:id', component: LanguageEditComponent },
      { path: 'detail/:id', component: LanguageDetailComponent }
    ]},
  // Rutas para jokes
  { path: 'jokes', children: [
    { path: '', component: JokesListComponent },
    { path: 'detail/:id', component: JokesDetailComponent },
    { path: 'create', component: JokesCreateComponent },
    { path: 'edit/:id', component: JokesEditComponent }
  ]},

  // Rutas para flags
  { path: 'flags', children: [
    { path: '', component: FlagsListComponent },
    { path: 'detail/:id', component: FlagsDetailComponent },
    { path: 'create', component: FlagsCreateComponent },
    { path: 'edit/:id', component: FlagsEditComponent }
  ]},

  // Rutas para categories
  { path: 'categories', children: [
    { path: '', component: CategoriesListComponent },
    { path: 'detail/:id', component: CategoriesDetailComponent },
    { path: 'create', component: CategoriesCreateComponent },
    { path: 'edit/:id', component: CategoriesEditComponent }
  ]}
];
