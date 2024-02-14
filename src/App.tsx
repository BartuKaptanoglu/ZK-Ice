import { MetaMaskButton, useAccount, useSDK, useSignMessage} from '@metamask/sdk-react-ui';
import './App.css';


//private RPC endpoint 
///const web3 = new Web3('https://sepolia-rpc.scroll.io/'); 

///const address = '0x...';
//const contract = new Contract(abi, address, { provider: "https://sepolia-rpc.scroll.io/"}); 

function AppReady() {
  const {
    data: signData,
    isError: isSignError,
    isLoading: isSignLoading,
    isSuccess: isSignSuccess,
    signMessage,
  } = useSignMessage({
    message: 'gm wagmi frens',
  });

  const { isConnected } = useAccount();

  return (
    
    <div className="App">
      <header className="App-header">
        <MetaMaskButton theme={'light'} color="white"></MetaMaskButton>
        {isConnected && (
          <>
            <div style={{ marginTop: 20 }}>
              <button disabled={isSignLoading} onClick={() => signMessage()}>
                Sign message
              </button>
              {isSignSuccess && <div>Signature: {signData}</div>}
              {isSignError && <div>Error signing message</div>}
            </div>
          </>
        )}
      </header>
      <h1 className="text-3xl font-bold underline blue">
      Hello world!
    </h1>
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