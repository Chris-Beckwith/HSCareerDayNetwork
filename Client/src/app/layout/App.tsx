import { useCallback, useEffect, useState } from "react";
import { Container, CssBaseline, ThemeProvider, createTheme } from "@mui/material";
import Header from "./Header";
import { Outlet, useLocation, useNavigate } from "react-router-dom";
import { toast, ToastContainer } from "react-toastify";
import 'react-toastify/dist/ReactToastify.css';
import { useAppDispatch } from "../store/configureStore";
import { fetchCurrentUser } from "../../features/account/accountSlice";
import LoadingComponent from "../components/LoadingComponent";
import SurveyHeader from "./SurveyHeader";

function App() {
  const dispatch = useAppDispatch()
  const navigate = useNavigate()
  const location = useLocation()
  const isSurvey = location.pathname.includes('/survey')
  const [loading, setLoading] = useState(true)

  const initApp = useCallback(async () => {
    try {
      const result = await dispatch(fetchCurrentUser())

      if (fetchCurrentUser.rejected.match(result)) {
        toast.error('Session expired - please login again')
        navigate('/')
      }
    } catch (error) {
      console.log(error)
    }
  }, [dispatch, navigate])

  useEffect(() => {
    initApp().then(() => setLoading(false))
  }, [initApp])

  const [darkMode, setDarkMode] = useState(() => {
    return localStorage.getItem("darkMode") === 'true'
  })
  const paletteType = darkMode ? 'dark' : 'light';
  const theme = createTheme({
    palette: {
      mode: paletteType,
      background: {
        default: paletteType === 'light' ? '#eaeaea' : '#121212'
      }
    }
  })

  useEffect(() => {
    localStorage.setItem("darkMode", String(darkMode))
  },[darkMode])

  function handleThemeChange() {
    setDarkMode(!darkMode)
  }

  return (
    <ThemeProvider theme={theme}>
      <ToastContainer position="bottom-right" hideProgressBar theme="colored" />
      <CssBaseline />
      {isSurvey ? <SurveyHeader darkMode={darkMode} handleThemeChange={handleThemeChange} /> 
      : <Header darkMode={darkMode} handleThemeChange={handleThemeChange} />}
      {loading ? <LoadingComponent message="Initilizing App.." />
        : <Container>
            <Outlet />
          </Container>
      }
    </ThemeProvider>
  )
}

export default App
