import { InitialData, LanguageCode } from '@vendure/core';

export const initialData: InitialData = {
  paymentMethods: [],
  defaultLanguage: LanguageCode.en,
  countries: [],
  defaultZone: 'NIGERIA',
  taxRates: [{name:'NGN',percentage:0}],
  shippingMethods: [],
  collections: [],
};