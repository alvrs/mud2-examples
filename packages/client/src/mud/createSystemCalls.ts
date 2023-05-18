import { getComponentValue } from "@latticexyz/recs";
import { awaitStreamValue } from "@latticexyz/utils";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  { worldSend, txReduced$, singletonEntity }: SetupNetworkResult,
  { Counter, TestData, TestKeyedData }: ClientComponents
) {
  const increment = async () => {
    const tx = await worldSend("increment", []);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(Counter, singletonEntity);
  };

  const incrementSquared = async () => {
    const tx = await worldSend("incrementSquared", []);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(Counter, singletonEntity);
  };

  const pushRecordToTestData = async () => {
    const tx = await worldSend("pushRecordToTestData", []);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(TestData, singletonEntity);
  };

  const pushRecordToTestKeyedData = async (id: number) => {
    const tx = await worldSend("pushRecordToTestKeyedData", [id]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(TestKeyedData, { id });
  };

  return {
    increment,
    incrementSquared,
    pushRecordToTestData,
    pushRecordToTestKeyedData,
  };
}
