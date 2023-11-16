'use strict';

function LikeButton() {

    return React.createElement(
        'button',
        {
            onClick: () => checkInput(),
        },
        'Like'
    );
}

const domContainer = document.querySelector('#like_button_container');
const root = ReactDOM.createRoot(domContainer);
root.render(React.createElement(LikeButton));
