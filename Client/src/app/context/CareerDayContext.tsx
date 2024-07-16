// import { PropsWithChildren, createContext, useContext, useState } from "react";
// import { CareerEvent } from "../models/event";

// interface CareerDayContextValue {
//     currentEvent: CareerEvent | null;
//     setCurrentEvent: (careerEvent: CareerEvent) => void;
//     removeCurrentEvent: () => void;
// }

// export const CareerDayContext = createContext<CareerDayContextValue | undefined>(undefined)

// // eslint-disable-next-line react-refresh/only-export-components
// export function useCareerDayContext() {
//     const context = useContext(CareerDayContext)

//     if (context === undefined) {
//         throw Error("We are not inside the provider");
//     }

//     return context;
// }

// export function CareerDayProvider({children}: PropsWithChildren<unknown>) {
//     const [currentEvent, setCurrentEvent] = useState<CareerEvent | null>(null);

//     function removeCurrentEvent() {
//         if (!currentEvent) return
//         setCurrentEvent(null)
//     }

//     return (
//         <CareerDayContext.Provider value={{currentEvent, setCurrentEvent, removeCurrentEvent}}>
//             {children}
//         </CareerDayContext.Provider>
//     )
// }