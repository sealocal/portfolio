'use strict';

const element = React.createElement;

class LearnMoreContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      clickCount: 0
    };
    this.messages = [
      ['Sorry, something went wrong! : (', ''],
      ['Thanks for subscribing to my newsletter!', 'unsubscribe'],
      ['Your contact info was auto-detected from social profiles.', 'undo']
    ];
  }

  incrementClickCount() {
    this.setState({
      clickCount: this.state.clickCount + 1
    })
  }

  render() {
    if (this.state.clickCount) {
      const [ message, linkText ] = this.messages.pop();
      return element('span', {}, [
          message,
          element('a', { key: 1, href: '#', style: { marginLeft: '.5em' }, onClick: this.incrementClickCount.bind(this) }, linkText)
        ]
      )
    }

    return element(
      'a',
      { href: '#', onClick: this.incrementClickCount.bind(this) },
      'Learn More ...'
    );
  }
}

const domElement = document.querySelector('#learn-more-container');
ReactDOM.render(element(LearnMoreContainer), domElement);
