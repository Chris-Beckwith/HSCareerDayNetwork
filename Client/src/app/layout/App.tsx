import { useCallback, useEffect, useState } from "react";
import { Container, CssBaseline, ThemeProvider, createTheme } from "@mui/material";
import Header from "./Header";
import { Outlet } from "react-router-dom";
import { ToastContainer } from "react-toastify";
import 'react-toastify/dist/ReactToastify.css';
import { useAppDispatch } from "../store/configureStore";
import { fetchCurrentUser } from "../../features/account/accountSlice";
import LoadingComponent from "../components/LoadingComponent";

function App() {
  const dispatch = useAppDispatch()
  const [loading, setLoading] = useState(true)

  const initApp = useCallback(async () => {
    try {
      await dispatch(fetchCurrentUser())
    } catch (error) {
      console.log(error)
    }
  }, [dispatch])

  useEffect(() => {
    initApp().then(() => setLoading(false))
  }, [initApp])

  const [darkMode, setDarkMode] = useState(false);
  const paletteType = darkMode ? 'dark' : 'light';
  const theme = createTheme({
    palette: {
      mode: paletteType,
      background: {
        default: paletteType === 'light' ? '#eaeaea' : '#121212'
      }
    }
  });

  function handleThemeChange() {
    setDarkMode(!darkMode)
  }

  return (
    <ThemeProvider theme={theme}>
      <ToastContainer position="bottom-right" hideProgressBar theme="colored" />
      <CssBaseline />
      <Header darkMode={darkMode} handleThemeChange={handleThemeChange} />
      {loading ? <LoadingComponent message="Initilizing App.." />
        : <Container>
            <Outlet />
          </Container>
      }
    </ThemeProvider>
  )
}

export default App
