module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/components/**/*.html.erb',
    './app/views/**/*.html.haml',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    colors: {
      'black100': '#000000',
      'black60': '#707070',
      'black30': '#c2c2c2',
      'white100': '#ffffff',
      'blue100': '#1023d7',
    },
    fontSize: {
      'xxl': '50px',
      'xl': '34px',
      'lg': '24px',
      'md': '16px',
      'sm': '16px',
      'xs': '13px',
    },
    lineHeight: {
      'xxl': '54px',
      'xl': '38px',
      'lg': '28px',
      'md': '20px',
      'sm': '24px',
      'xs': '18px',
    },
    letterSpacing: {
      'xxl': '-0.02em',
      'xl': '-0.02em',
      'lg': '-0.02em',
      'md': 'normal',
      'sm': 'normal',
      'xs': 'normal',
    },
    spacing: {
      '1': '10px',
      '2': '20px',
      '4': '40px',
      '6': '60px',
      '12': '10px',
      '0.5': '5px',
    }
  }
}
