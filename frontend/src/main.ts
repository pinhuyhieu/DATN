import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { HomeComponent } from './app/home/home.component';
import { DetailProductComponent } from './app/detail-product/detail-product.component';

bootstrapApplication(DetailProductComponent, appConfig)
  .catch((err) => console.error(err));
