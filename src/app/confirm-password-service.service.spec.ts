import { TestBed } from '@angular/core/testing';

import { ConfirmPasswordServiceService } from './confirm-password-service.service';

describe('ConfirmPasswordServiceService', () => {
  let service: ConfirmPasswordServiceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ConfirmPasswordServiceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
