import React, { useState } from 'react';
import { MetaMaskButton, useAccount, useSDK, useSignMessage} from '@metamask/sdk-react-ui';
import './App.css';

function AppReady() {
  const [inputValue, setInputValue] = useState('');
  const {
    data: signData,
    isError: isSignError,
    isSuccess: isSignSuccess,
  } = useSignMessage({
    message: 'gm wagmi frens',
  });
  let proposals = [];
  let id = 0;
  
  const { isConnected } = useAccount();

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setInputValue(event.target.value);
  };

  const handleSeparateButtonClick = () => {
    // Implement separate button functionality here
    alert('Separate button clicked');
  };

  return (
    <div className="App">
      <button onClick={handleSeparateButtonClick}>
                Separate Button
              </button>
      <header className="App-header">
        <MetaMaskButton theme={'light'} color="white"></MetaMaskButton>
        {isConnected && (
          <>
            <div style={{ marginTop: 20 }}>
              <input
                type="text"
                value={inputValue}
                onChange={handleInputChange}
                placeholder="Enter message"
              />
              
              {isSignSuccess && <div>Signature: {signData}</div>}
              {isSignError && <div>Error signing message</div>}
            </div>
        
          </>
        )}
      </header>
      
    </div>
  );
}

const App: React.FC = () => {
  const { ready } = useSDK();

  if (!ready) {
    return <div>Loading...</div>;
  }

  return <AppReady />;
}

export default App;
