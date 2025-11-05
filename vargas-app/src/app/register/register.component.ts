import { Component, OnInit } from '@angular/core';
import { AppComponent, User } from "../app.component";
import { HttpClient } from "@angular/common/http";
import { Router } from "@angular/router";

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  constructor(private http: HttpClient, private router: Router) {}

  model: User = {
    username: '',
    password: '',
    firstname: '',
    lastname: '',
    email: '',
    address: '',
    phone: null,
    merchant: null
  };

  options: string = null;
  present: boolean = null;
  usernameAvailability: string;
  fontColor: string;

  phoneValidation: boolean = true;
  emailValidation: boolean = true;
  passwordValidation: boolean = true;

  ngOnInit() {}

  usernamePresent(): void {
    this.fontColor = '';
    let url = "http://localhost:8080/checkUserName";

    this.http.post<boolean>(url, this.model.username).subscribe(
      res => {
        this.present = res;
        if (this.present) {
          this.fontColor = "red";
          this.usernameAvailability = "UserName Already Taken";
        } else {
          this.fontColor = "green";
          this.usernameAvailability = "Available";
        }
      },
      err => {
        console.error("Username check failed", err);
      }
    );
  }

  updateSelect() {
    // If user selects "User", merchant = false
    // If selects "Merchant", merchant = true
    this.model.merchant = this.options === 'Merchant';
  }

  checkPhone() {
    let matcher = new RegExp('^[0-9]{10}$');
    this.phoneValidation = matcher.test(String(this.model.phone));
  }

  checkEmail() {
    if (!this.model.email) {
      this.emailValidation = true;
      return;
    }
    this.emailValidation = this.model.email.includes('@');
  }

  passwordStrength() {
    if (this.model.password.length === 0) {
      this.passwordValidation = true;
      return;
    }

    if (this.model.password.length < 8) {
      this.passwordValidation = false;
      return;
    }

    const matcher = new RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\\$%\\^&\\*])(?=.{8,16})');
    this.passwordValidation = matcher.test(this.model.password);
  }

registerUser():void {
  this.updateSelect();

  this.model.merchant = this.options === 'Merchant';

  let url = "http://localhost:8080/register";
  this.http.post<User>(url, this.model).subscribe(
    res => {
      AppComponent.modelUser = res;
      this.router.navigate(['welcome']);
    },
    err => {
      console.log([this.model]);
      alert("An error has occurred while Registering");
    }
  );
}

}
