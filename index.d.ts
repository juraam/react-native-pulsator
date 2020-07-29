import React from "react";
import { ViewProperties } from "react-native";

export interface PulsatorProperties extends ViewProperties {
  color: String;

  animationDuration: Number;

  pulseInterval: Number;

  repeatCount: Number;

  numPulse: Number;

  radius: Number;
}

interface PulsatorStatic extends React.ComponentClass<PulsatorProperties> { }

declare var Pulsator: PulsatorStatic;

type Pulsator = PulsatorStatic;

export default Pulsator;
