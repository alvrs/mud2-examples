// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("testing"), bytes16("OwnerNamespaces")));
bytes32 constant OwnerNamespacesTableId = _tableId;

library OwnerNamespaces {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES16_ARRAY;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.ADDRESS;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](1);
    _fieldNames[0] = "namespaceIds";
    return ("OwnerNamespaces", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get namespaceIds */
  function get(address owner) internal view returns (bytes16[] memory namespaceIds) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes16());
  }

  /** Get namespaceIds (using the specified store) */
  function get(IStore _store, address owner) internal view returns (bytes16[] memory namespaceIds) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes16());
  }

  /** Set namespaceIds */
  function set(address owner, bytes16[] memory namespaceIds) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    StoreSwitch.setField(_tableId, _keyTuple, 0, EncodeArray.encode((namespaceIds)));
  }

  /** Set namespaceIds (using the specified store) */
  function set(IStore _store, address owner, bytes16[] memory namespaceIds) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    _store.setField(_tableId, _keyTuple, 0, EncodeArray.encode((namespaceIds)));
  }

  /** Get the length of namespaceIds */
  function length(address owner) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 16;
  }

  /** Get the length of namespaceIds (using the specified store) */
  function length(IStore _store, address owner) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 16;
  }

  /** Get an item of namespaceIds (unchecked, returns invalid data if index overflows) */
  function getItem(address owner, uint256 _index) internal view returns (bytes16) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 16, (_index + 1) * 16);
    return (Bytes.slice16(_blob, 0));
  }

  /** Get an item of namespaceIds (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItem(IStore _store, address owner, uint256 _index) internal view returns (bytes16) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 16, (_index + 1) * 16);
    return (Bytes.slice16(_blob, 0));
  }

  /** Push an element to namespaceIds */
  function push(address owner, bytes16 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /** Push an element to namespaceIds (using the specified store) */
  function push(IStore _store, address owner, bytes16 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    _store.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /** Pop an element from namespaceIds */
  function pop(address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 16);
  }

  /** Pop an element from namespaceIds (using the specified store) */
  function pop(IStore _store, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    _store.popFromField(_tableId, _keyTuple, 0, 16);
  }

  /** Update an element of namespaceIds at `_index` */
  function update(address owner, uint256 _index, bytes16 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 16, abi.encodePacked((_element)));
  }

  /** Update an element of namespaceIds (using the specified store) at `_index` */
  function update(IStore _store, address owner, uint256 _index, bytes16 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    _store.updateInField(_tableId, _keyTuple, 0, _index * 16, abi.encodePacked((_element)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(bytes16[] memory namespaceIds) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](1);
    _counters[0] = uint40(namespaceIds.length * 16);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return abi.encodePacked(_encodedLengths.unwrap(), EncodeArray.encode((namespaceIds)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(address owner) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));
  }

  /* Delete all data for given keys */
  function deleteRecord(address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(uint160((owner))));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
