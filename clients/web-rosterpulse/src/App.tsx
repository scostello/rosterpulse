import { css } from '@emotion/react';
import React from 'react';

const color = 'white';

const App = () => (
  <div
    css={css`
      padding: 32px;
      background-color: hotpink;
      font-size: 24px;
      border-radius: 4px;
      &:hover {
        color: ${color};
      }
    `}
  >
    Hover to change color.
  </div>
);

export default App;
