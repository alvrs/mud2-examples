/* Autogenerated file. Do not edit manually. */

import { TableId } from "@latticexyz/utils";
import { defineComponent, Type as RecsType, World } from "@latticexyz/recs";

export function defineContractComponents(world: World) {
  return {
    Counter: (() => {
      const tableId = new TableId("", "Counter");
      return defineComponent(
        world,
        {
          counterValue: RecsType.Number,
          counterValueSquared: RecsType.Number,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    TestData: (() => {
      const tableId = new TableId("", "TestData");
      return defineComponent(
        world,
        {
          testUint32: RecsType.Number,
          testBytes32: RecsType.String,
          testString: RecsType.String,
          testUint32Array: RecsType.NumberArray,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    TestKeyedData: (() => {
      const tableId = new TableId("", "TestKeyedData");
      return defineComponent(
        world,
        {
          testUint32: RecsType.Number,
          testBytes32: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
  };
}
