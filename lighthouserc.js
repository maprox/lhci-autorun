const {
  LHCI_COLLECT_NUMBER_OF_RUNS = 3,
  LHCI_COLLECT_URL = '',
  LHCI_UPLOAD_TARGET = 'lhci',
  LHCI_UPLOAD_SERVER_BASE_URL,
  LHCI_UPLOAD_TOKEN,
  LHCI_UPLOAD_BASIC_AUTH_USERNAME,
  LHCI_UPLOAD_BASIC_AUTH_PASSWORD,
} = process.env

module.exports = {
  ci: {
    collect: {
      numberOfRuns: LHCI_COLLECT_NUMBER_OF_RUNS,
      url: LHCI_COLLECT_URL.split(' ')
    },
    upload: {
      target: LHCI_UPLOAD_TARGET,
      serverBaseUrl: LHCI_UPLOAD_SERVER_BASE_URL,
      token: LHCI_UPLOAD_TOKEN,
      ...(LHCI_UPLOAD_BASIC_AUTH_USERNAME ? {
        basicAuth: {
          username: LHCI_UPLOAD_BASIC_AUTH_USERNAME,
          password: LHCI_UPLOAD_BASIC_AUTH_PASSWORD
        }
      } : {})
    },
  },
}
